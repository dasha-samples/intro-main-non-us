library

digression for_system_intents
{
    conditions { on true priority 100000; }
    do
    {
        var sentiment_positive: string?;
        var sentiment_negative: string?;
        var you_already_called_me: string?;
        var are_you_a_robot: string?;
        var introduce_yourself: string?;
        var self: string?;
        var can_you_hear_me: string?;
        var where_did_you_get_my_number: string?;
        var common_what_company: string?;
        var whom_do_you_call: string?;
        var what_do_you_want: string?;
        var ping: string?;
        var bye: string?;
        var not_interested: string?;
        var thank_you: string?;
        var dont_understand: string?;
        var answering_machine: string?;
        var wrong_number: string?;
        var wrong_person: string?;
        var obscene: string?;
        var if_fast: string?;
        var wait_please: string?;
        var may_continue: string?;
        var call_later: string?;
        var potential_call_later: string?;
        var do_not_call: string?;
        var repeat: string?;
        var everything_is_ok: string?;
        var about_the_scale: string?;
        var lack_of_experience: string?;
        if(#messageHasSentiment("positive") 
        || #messageHasSentiment("negative") 
        || #messageHasIntent("you_already_called_me")
        || #messageHasIntent("are_you_a_robot")
        || #messageHasIntent("introduce_yourself")
        || #messageHasIntent("self")
        || #messageHasIntent("can_you_hear_me")
        || #messageHasIntent("where_did_you_get_my_number")
        || #messageHasIntent("common_what_company")
        || #messageHasIntent("whom_do_you_call")
        || #messageHasIntent("what_do_you_want")
        || #messageHasIntent("ping")
        || #messageHasIntent("bye")
        || #messageHasIntent("not_interested")
        || #messageHasIntent("thank_you")
        || #messageHasIntent("dont_understand")
        || #messageHasIntent("answering_machine")
        || #messageHasIntent("wrong_number")
        || #messageHasIntent("wrong_person")
        || #messageHasIntent("obscene")
        || #messageHasIntent("if_fast")
        || #messageHasIntent("wait_please")
        || #messageHasIntent("may_continue")
        || #messageHasIntent("call_later")
        || #messageHasIntent("potential_call_later")
        || #messageHasIntent("do_not_call")
        || #messageHasIntent("repeat")
        || #messageHasIntent("everything_is_ok")
        || #messageHasIntent("about_the_scale")
        || #messageHasIntent("lack_of_experience")        )
        {
        if(#messageHasSentiment("positive")){set sentiment_positive ="позитивный сентимент. ";} else set sentiment_positive ="";
        if(#messageHasSentiment("negative")){set sentiment_negative ="негативный сентимент. ";} else set sentiment_negative ="";
        if(#messageHasIntent("you_already_called_me")){set you_already_called_me ="интент вы мне уже звонили - важно использовать, чтобы не разговаривать с теми, с кем уже говорили ранее.";} else set you_already_called_me ="";
        if(#messageHasIntent("are_you_a_robot")){set are_you_a_robot ="вы спросили, не робот ли я, на это у меня уже есть реакция. Можете посмотреть подробнее в файле ай эм робот.";} else set are_you_a_robot ="";
        if(#messageHasIntent("introduce_yourself")){set introduce_yourself ="интент а вы кто такой ";} else set introduce_yourself ="";
        if(#messageHasIntent("self")){set self ="интент про представьтесь пожалуйста ";} else set self ="";
        if(#messageHasIntent("can_you_hear_me")){set can_you_hear_me ="интент вы меня слышите - иногда, когда я по различным причинам молчу или сразу не могу понять, люди спрашивают это у меня. ";} else set can_you_hear_me ="";
        if(#messageHasIntent("where_did_you_get_my_number")){set where_did_you_get_my_number ="интент где вы взяли мой номер - обычно так спрашивают не очень довольные звонком люди, бывает.. ";} else set where_did_you_get_my_number ="";
        if(#messageHasIntent("common_what_company")){set common_what_company ="какая компания - довольно полезный интент, если вы звоните от имени компании. ";} else set common_what_company ="";
        if(#messageHasIntent("whom_do_you_call")){set whom_do_you_call ="кому вы звоните - полезная штука, если вы делаете модель на исходящие звонки. ";} else set whom_do_you_call ="";
        if(#messageHasIntent("what_do_you_want")){set what_do_you_want ="интент что вы хотите - можно использовать в начале диалога, чтобы перейти к сути звонка. ";}else set what_do_you_want ="";
        if(#messageHasIntent("ping")){set ping ="вы сказал алло - такая реакция уже у меня есть, можете посмотреть подробнее в файле репит и пинг.  ";} else set ping ="";
        if(#messageHasIntent("bye")){set bye ="интент про досвидания - если такой интент я получаю в начале диалога, я всегда задумываюсь, а надо ли мне продолжать разговор?.. ";} else set bye ="";
        if(#messageHasIntent("not_interested")){set not_interested ="интент про не интересно, ну что-ж, не интересно так не интересно. ";} else set not_interested ="";
        if(#messageHasIntent("thank_you")){set thank_you ="интент благодарности, но в начале диалога такой интент отзначает вежливый отказ. ";} else set thank_you ="";
        if(#messageHasIntent("dont_understand")){set dont_understand ="интент, о том, что вы что то не поняли ";} else set dont_understand ="";
        if(#messageHasIntent("answering_machine")){set answering_machine ="интент про автоответчик, у меня уже есть такая стандартная реакция, могу определять автоответчики. ";} else set answering_machine ="";
        if(#messageHasIntent("wrong_number")){set wrong_number ="интент неверный номер - уже есть такая реакция, можете посмотреть подробнее в файле wont call anymore. ";} else set wrong_number ="";
        if(#messageHasIntent("wrong_person")){set wrong_person ="похоже, я разговариваю не с тем человеком, по крайней мере был выделен такой интент. Его полезно использовать в начале разговора. ";} else set wrong_person ="";
        if(#messageHasIntent("obscene")){set obscene ="ох, кто-то ругается нехорошими словами. интент обценной лексики. В обычном разговоре я бы извинилась и положила трубку. ";} else set obscene ="";
        if(#messageHasIntent("if_fast")){set if_fast ="интент если по быстрому - полезен в начале разговора, когда говорят что то типа ну давайте быстрее. ";} else set if_fast ="";
        if(#messageHasIntent("wait_please")){set wait_please ="интент про подождать. Эта реакция у меня уже есть - в файле wait ";} else set wait_please ="";
        if(#messageHasIntent("may_continue")){set may_continue ="интент что вы хотели - полезно использовать в начале разговора, человек явно готов слушать мой прекрасный голос дальше. ";} else set may_continue ="";
        if(#messageHasIntent("call_later")){set call_later ="перезвоните позже - такая стандартная реакция у меня уже есть, вам останется только настроить расписание для таких случаев. ";} else set call_later ="";
        if(#messageHasIntent("potential_call_later")){set potential_call_later ="интент о том, что наверное надо перезвонить, полезен в некоторых случаях, когда человек не говорит прямо, что он сейчас не может говорить. ";}else set potential_call_later ="";
        if(#messageHasIntent("do_not_call")){set do_not_call ="интент не звоните - обычно я получаю такой огорчающий интент, когда моему звонку не рады.  ";} else set do_not_call ="";
        if(#messageHasIntent("repeat")){set repeat ="повторите - интент о просьбе повторить моё предлложение. Кстати, чтобы я выглядела человечнее, добавляйте пожалуйста во фрейзмап повторы для каждой фразы. ";} else set repeat ="";
        if(#messageHasIntent("everything_is_ok")){set everything_is_ok ="интент все отлично. Использутется там, где надо получить оценку. ";} else set everything_is_ok ="";
        if(#messageHasIntent("about_the_scale")){set about_the_scale ="интент про шкалу оценок, когда у меня спрашивают по какой шкале идёт оценка. ";} else set about_the_scale ="";
        if(#messageHasIntent("lack_of_experience")){set lack_of_experience ="отсутствие опыта - интент, полезный в опросах. А то вдруг человек не пользовался вашим сервисом а вы с него оценку требуте? ";} else set lack_of_experience ="";
        #say("list_of_intents",
        {
            sentiment_positive: sentiment_positive,
            sentiment_negative: sentiment_negative,
            you_already_called_me: you_already_called_me,
            are_you_a_robot: are_you_a_robot,
            introduce_yourself: introduce_yourself,
            self: self,
            can_you_hear_me: can_you_hear_me,
            where_did_you_get_my_number: where_did_you_get_my_number,
            common_what_company: common_what_company,
            whom_do_you_call: whom_do_you_call,
            what_do_you_want: what_do_you_want,
            ping: ping,
            bye: bye,
            not_interested: not_interested,
            thank_you: thank_you,
            dont_understand: dont_understand,
            answering_machine: answering_machine,
            wrong_number: wrong_number,
            wrong_person: wrong_person,
            obscene: obscene,
            if_fast: if_fast,
            wait_please: wait_please,
            may_continue: may_continue,
            call_later: call_later,
            potential_call_later: potential_call_later,
            do_not_call: do_not_call,
            repeat: repeat,
            everything_is_ok: everything_is_ok,
            about_the_scale: about_the_scale,
            lack_of_experience: lack_of_experience
        });
        }
        else
        {
            #sayText("К сожалению, из данной фразы я не смогла ничего выделить.");
        }
        goto transition0;
    }
    transitions
    {
        transition0: goto system_intents_next;
    }
}