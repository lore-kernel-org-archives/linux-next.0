From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH linux-next]cputime: fix compiler warning caused by timeval_to_cputime()
Date: Mon, 18 Feb 2013 13:31:43 +0100
Message-ID: <CAFTL4hwHjHqeSdvXiJve0-Rhfwzhs8dk7DXV3WG4HVBwHW1gTQ@mail.gmail.com>
References: <1361084006.2580.16.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35085 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203Ab3BRMbp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Feb 2013 07:31:45 -0500
Received: by mail-la0-f47.google.com with SMTP id fj20so5403940lab.34
        for <linux-next@vger.kernel.org>; Mon, 18 Feb 2013 04:31:43 -0800 (PST)
In-Reply-To: <1361084006.2580.16.camel@ThinkPad-T5421.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>

2013/2/17 Li Zhong <zhong@linux.vnet.ibm.com>:
> Saw the following compiler warning on next tree:
>
> kernel/itimer.c: In function 'set_cpu_itimer':
> kernel/itimer.c:152:2: warning: passing argument 1 of
> 'timeval_to_cputime' discards 'const' qualifier from pointer target type
> [enabled by default]
> ...
>
> Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>

Applied and will send to Ingo.

Thanks Li!
