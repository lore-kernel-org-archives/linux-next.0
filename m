From: Alexei Starovoitov <ast@plumgrid.com>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 08:09:02 -0700
Message-ID: <55E46E0E.1040007@plumgrid.com>
References: <20150831195420.371e8849@canb.auug.org.au>
 <20150831141736.GA19616@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:32920 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124AbbHaPJE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 11:09:04 -0400
Received: by padhy3 with SMTP id hy3so37564963pad.0
        for <linux-next@vger.kernel.org>; Mon, 31 Aug 2015 08:09:04 -0700 (PDT)
In-Reply-To: <20150831141736.GA19616@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, "pi-cheng.chen" <pi-cheng.chen@linaro.org>

On 8/31/15 7:17 AM, Guenter Roeck wrote:
> s390:
>
> kernel/built-in.o: In function `bpf_trace_printk':
> bpf_trace.c:(.text+0x116a5c): undefined reference to `strncpy_from_unsafe'
> kernel/built-in.o: In function `fetch_memory_string':
> trace_kprobe.c:(.text+0x118ee0): undefined reference to `strncpy_from_unsafe'
>
> Appears to be due to 'bpf: add support for %s specifier to bpf_trace_printk()'.

working on a fix...
