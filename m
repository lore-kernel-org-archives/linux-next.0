From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: next-0704: x86_64 panics on booting
Date: Fri, 4 Jul 2008 18:53:49 +0400
Message-ID: <a4423d670807040753u21b01f7au8f5c1d89d8281c19@mail.gmail.com>
References: <a4423d670807040720o3e8e350ds5c13dfca8e8adc58@mail.gmail.com>
	 <20080704142409.GA18824@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.225]:65381 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754757AbYGDOxu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 10:53:50 -0400
Received: by wx-out-0506.google.com with SMTP id h29so522187wxd.4
        for <linux-next@vger.kernel.org>; Fri, 04 Jul 2008 07:53:49 -0700 (PDT)
In-Reply-To: <20080704142409.GA18824@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com

2008/7/4 Ingo Molnar <mingo@elte.hu>:
> does the patch below fix it?
>
>        Ingo
>
> -------------->
> commit 181b3601a1a7d2ac3ace6b23cb3204450a4f9a27
> Author: Jeremy Fitzhardinge <jeremy@goop.org>
> Date:   Sun Jun 29 20:02:44 2008 -0700
>
>    x86: setup_arch() && early_ioremap_init()

Yes, thanks!
