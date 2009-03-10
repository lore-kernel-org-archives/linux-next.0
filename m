From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [RFC 2/4] net: netfilter conntrack - add per-net functionality
	for DCCP protocol
Date: Tue, 10 Mar 2009 14:51:20 +0300
Message-ID: <aa79d98a0903100451r6179ca61l3573cd8ae6e171b7@mail.gmail.com>
References: <20090309181628.109019157@gmail.com>
	 <20090309182731.762563452@gmail.com> <49B63EA6.2060802@free.fr>
	 <49B6420B.4080309@free.fr>
	 <aa79d98a0903100359x5cba797fu9611823b91c64b42@mail.gmail.com>
	 <49B65076.6090003@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f176.google.com ([209.85.220.176]:41679 "EHLO
	mail-fx0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbZCJLvX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2009 07:51:23 -0400
In-Reply-To: <49B65076.6090003@openvz.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pavel Emelyanov <xemul@openvz.org>
Cc: Daniel Lezcano <daniel.lezcano@free.fr>, davem@davemloft.net, kaber@trash.net, netdev@vger.kernel.org, linux-next@vger.kernel.org, adobriyan@gmail.com, Cyrill Gorcunov <gorcunov@openvz.org>

On Tue, Mar 10, 2009 at 2:35 PM, Pavel Emelyanov <xemul@openvz.org> wrote:
...
>>>>>   static int __init nf_conntrack_proto_dccp_init(void)
>>>>>  {
>>>>>     int err;
>>>>>  -    err = nf_conntrack_l4proto_register(&dccp_proto4);
>>>>> +    err = register_pernet_gen_device(&dccp_net_id, &dccp_net_ops);
>>>>>
>>> [ cut ]
>>>> Shouldn't it be register_pernet_gen_subsys ?
>>
>> No, I believe. By using  register_pernet_gen_device I'm allowed to
>> not modify 'struct net' and friends and keep all I need in my own
>> pointer retrieved thru per-net gen-device id I've registered.
>
> I believe Daniel means, that we need the register_xxx_get_subsys call
> for subsystems, rather than devices, that will behave according to the
> generic net pointers.
>
> Daniel, am I right with this suggestion?
>
...
Ah, yes, just checked register_pernet_gen_subsys -- it's what I need. Thanks!
