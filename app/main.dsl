import "commonReactions/all.dsl";
import "systemIntents/systemIntents.dsl";
context
{
    input phone: string;
    text: string?;
    positive_or_negative: boolean = false;
    system_intents: boolean = false;
}

start node root
{
    do
    {
        #connectSafe($phone);
        digression disable
        {
            for_system_intents
        }
        ;
        #waitForSpeech(1000);
        #say("greeting");
        
        wait *;
    }
    transitions
    {
        transition0: goto positive_or_negative on #messageHasSentiment("positive");
        transition1: goto bye on #messageHasSentiment("negative");
    }
}

node bye
{
    do
    {
        #sayText("Жаль, хотела рассказать Вам много интересного. До свидания!"); //Если фраза Даши одна, то можно не пользоваться phrasemap.json, а использовать команду #sayText
        exit;
    }
}

node positive_or_negative
{
    do
    {
        //set $positive_or_negative=true;
        #setVadPauseLength(1.5); //Даша слушает дольше обычного в 1,5 раза - это полезная функция, когда реплика человека может быль длинной или во время высказывания человек делает паузы. Но везде ставить эту переменную нельзя - робот будет "тормозить" Также ниже по скрипту не забудьте вернуть к дефолтному значению (1)
        if ($positive_or_negative)
        {
            #say("system_intents_second");
        }
        else
        {
            #say("positive_or_negative");
        }
        wait *;
    }
    transitions
    {
        positive: goto positive on #messageHasSentiment("positive");
        negative: goto negative on #messageHasSentiment("negative");
    }
    onexit
    {
        positive: do
        {
            set $text = #getMessageText();
        }
        negative: do
        {
            set $text = #getMessageText();
        }
    }
}

node positive
{
    do
    {
        #say("positive",
        {
            text: $text
        }
        );
        goto transition0;
    }
    transitions
    {
        transition0: goto next_or_not;
    }
}
node negative
{
    do
    {
        #say("negative",
        {
            text: $text
        }
        );
        goto transition0;
    }
    transitions
    {
        transition0: goto next_or_not;
    }
}
node next_or_not
{
    do
    {
        set $positive_or_negative=true;
        #setVadPauseLength(1); // Вернул переменную к дефолтному значению, теперь Даша далее по скрипту будет реагировать быстро, как обычно.
        #say("next_or_not");
        wait *;
    }
    transitions
    {
        transition0: goto positive_or_negative on #messageHasSentiment("positive");
        transition: goto intents on #messageHasSentiment("negative");
    }
}
node intents
{
    do
    {
        set $positive_or_negative=false;
        #say("intents");
        wait *;
    }
    transitions
    {
        transition0: goto system_intents on #messageHasSentiment("positive");
        transition1: goto bye on #messageHasSentiment("negative");
    }
}

node system_intents
{
    do
    {
        if($system_intents)
        {
            #say("system_intents_second");
        }
        else
        #say("system_intents");
        digression enable
        {
            for_system_intents
        }
        ;
        digression disable
        {
            answering_machine, i_will_call_back, can_hear_you, i_am_robot, repeat, swear_words, @wait, sorry_wont_call
        }
        ;
        wait *;
    }
    transitions
    {
        transition0: goto system_intents_next;
        transition1: goto custom_inents;
    }
}

node system_intents_next
{
    do
    {
        digression disable
        {
            for_system_intents
        }
        ;
        
        set$ system_intents=true;
        #say("next_or_not");
        wait *;
    }
    transitions
    {
        transition0: goto system_intents on #messageHasSentiment("positive");
        transition1: goto custom_inents on #messageHasSentiment("negative");
    }
}
node custom_inents
{
    do
    {
        digression enable
        {
            answering_machine, i_will_call_back, can_hear_you, i_am_robot, repeat, swear_words, @wait, sorry_wont_call
        }
        ;
        #say("custom_inents");
        wait *;
    }
    transitions
    {
        transition0: goto ner on #messageHasSentiment("positive");
        transition1: goto bye on #messageHasSentiment("negative");
    }
}
node ner
{
    do
    {
        #say("ner");
        wait *;
    }
    transitions
    {
        transition0: goto before_graph_start on #messageHasSentiment("positive");
        transition1: goto bye on #messageHasSentiment("negative");
    }
}
node before_graph_start
{
    do
    {
        #say("before_graph_start");
        wait *;
    }
    transitions
    {
        transition0: goto graph_start on #messageHasSentiment("positive");
        transition1: goto bye on #messageHasSentiment("negative");
    }
}

node graph_start
{
    do
    {
        #say("build_script");
        #say("graph");
        #say("phrasemap");
        #say("intents_details");
        #say("profiler");
        #say("any_question");
        wait *;
    }
    transitions
    {
        transition1: goto good_luck on true;
    }
}

node good_luck
{
    do
    {
        if(#messageHasSentiment("positive"))
    {
        #say("community");
    }
    else
        #say("before_end");
        exit;
    }
}
