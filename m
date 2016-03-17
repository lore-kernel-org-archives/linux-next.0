From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [cocci: new build warnings]: next-20160316 setup_timer.cocci
Date: Thu, 17 Mar 2016 06:33:01 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1603170632450.2301@localhost6.localdomain6>
References: <56E9F4F8.70708@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:50820 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751470AbcCQFdG (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2016 01:33:06 -0400
In-Reply-To: <56E9F4F8.70708@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: Vaishali Thakkar <vaishali.thakkar@oracle.com>, Michal Marek <mmarek@suse.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-next@vger.kernel.org, cocci@systeme.lip6.fr

On Wed, 16 Mar 2016, Nishanth Menon wrote:

> Hi,
> 
> It looks like commit c5eda8fd10c6 ("Coccinelle: Add
> api/setup_timer.cocci") with spatch rev(1.0.4 latest)[1] generates
> warning [2]. I am using spatch from the latest git tree[3]

Thanks for the feedback.  We will look into it.

julia

> rule name: parse error:
>   File "./scripts/coccinelle/api/setup_timer.cocci", line 109, column 0,
> charpos = 1939
>   around = '(',
>   whole content = '(context || org || report)@'
> 
> [1]
> spatch byte-code version 1.0.4-00203-gdb45d7549bdd compiled with OCaml
> version 4.01.0
> Flags passed to the configure script: [none]
> Python scripting support: yes
> Syntax of regular expresssions: PCRE
> 
> [2] http://pastebin.ubuntu.com/15405226/
> [3] https://github.com/coccinelle/coccinelle.git
> 
> -- 
> Regards,
> Nishanth Menon
> 
