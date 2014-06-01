class XML::Actions is HLL::Actions {
    method TOP($/) {
        nqp::say('TOP: '~$/);
    }

    method declaration($/) {
        nqp::say('declaration: '~$/);
    }

    method declaration_info($/) {
        nqp::say('declaration_info: '~$/);
    }

    # method markup_content($/) {
    # }

    method tag($/) {
        nqp::say('tag: '~$/);
    }

    method entity($/) {
        nqp::say('entity: '~$/);
    }

    method content($/) {
        nqp::say('content: '~$/);
    }

    # method name($/) {
    #     nqp::say('name: '~$/);
    # }

    method value($/) {
        nqp::say('value: '~$/);
    }
}
