From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Wed, 10 Dec 2008 09:05:44 -0800
Message-ID: <493FF6E8.2090201@schaufler-ca.com>
References: <20081208190708.1d2c37ec.sfr@canb.auug.org.au> <200812081441.12338.paul.moore@hp.com> <alpine.LRH.1.10.0812090815370.6220@tundra.namei.org> <200812081758.10731.paul.moore@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp101.prem.mail.sp1.yahoo.com ([98.136.44.56]:23465 "HELO
	smtp101.prem.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752963AbYLJRF5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 12:05:57 -0500
In-Reply-To: <200812081758.10731.paul.moore@hp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, casey@schaufler-ca.com

Paul Moore wrote:
> On Monday 08 December 2008 4:16:24 pm James Morris wrote:
>   
>> On Mon, 8 Dec 2008, Paul Moore wrote:
>>     
>>> James, is the security-testing tree rebased regularly or is
>>> suitable to back a tree against?
>>>       
>> No, it doesn't get rebased.
>>     
>
> Okay, experiment time.  I think I managed to pull from all the right 
> spots, merge everything appropriately and end up with a security/ 
> directory that builds so I pushed it back out to the lblnet-2.6_next 
> tree.  I'm not quite sure the proper etiquette here but I had to fix 
> Casey's patch a bit since it would apply cleanly; Casey if you could 
> take a look I would appreciate it (it isn't exactly like what Stephen 
> posted earlier but it is pretty darn close).
>
>   

The Smack Verification Laboratory reports that lblnet-2.6_next is
working as expected for UDP and TCP.

>>>  If so, I can rebase the lblnet-2.6_next tree
>>> against security-testing to resolve the conflict ...
>>>       
>> Ok, and I can carry your patches in there if necessary.
>>     
>
> I would like to figure out to make this work as it is likely to happen 
> again at some point in the future, but if I can't get it working 
> quickly I may punt on it and ask you to pull in the patches.
>
>   
