From: Daniel Lezcano <daniel.lezcano@free.fr>
Subject: Re: [RFC 2/4] net: netfilter conntrack - add per-net functionality
 for DCCP protocol
Date: Tue, 10 Mar 2009 14:02:52 +0100
Message-ID: <49B664FC.4070103@free.fr>
References: <20090309181628.109019157@gmail.com>	<20090309182731.762563452@gmail.com>	<49B63EA6.2060802@free.fr> <20090310.042537.49464370.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:36412 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755099AbZCJNDy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2009 09:03:54 -0400
In-Reply-To: <20090310.042537.49464370.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: gorcunov@gmail.com, kaber@trash.net, netdev@vger.kernel.org, linux-next@vger.kernel.org, xemul@openvz.org, adobriyan@gmail.com, gorcunov@openvz.org

David Miller wrote:
> From: Daniel Lezcano <daniel.lezcano@free.fr>
> Date: Tue, 10 Mar 2009 11:19:18 +0100
>
>   
>>>  static int __init nf_conntrack_proto_dccp_init(void)
>>>  {
>>>  	int err;
>>>  -	err = nf_conntrack_l4proto_register(&dccp_proto4);
>>> +	err = register_pernet_gen_device(&dccp_net_id, &dccp_net_ops);
>>>   
>>>       
>> Shouldn't it be register_pernet_gen_subsys ?
>>     
>
> Do I really have to carefully and meticuliously scan down
> hundreds and hundreds of irrelevant quoted patch text just
> to see what bit you're commenting on?
>
> Please, just provide the necessary context of the patch for
> your comments, don't quote the whole thing :-(
>   
Sorry, I will do that in the future.

  -- Daniel
