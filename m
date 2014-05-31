From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 2/2] x86,vdso: Fix cross-compilation from big-endian
 architectures
Date: Fri, 30 May 2014 17:14:58 -0700
Message-ID: <53891F02.50702@zytor.com>
References: <CALCETrXef77JLoEp5hCXSdMAk7usWsL-sUG6NrcgLgrz3krfag@mail.gmail.com> <cover.1401464755.git.luto@amacapital.net> <2cf258df123cb24bad63c274c8563c050547d99d.1401464755.git.luto@amacapital.net> <5388E3EF.6030700@zytor.com> <CALCETrVvR3SaYX7jvoX_q7m=HSzt1xvrDurrOpm2XT5SG3JVqw@mail.gmail.com> <5388E83A.5000500@zytor.com> <CALCETrWgfRiknJTQtDSAavF1695NDy-h-DW1big+65-HmEOtwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:49388 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932699AbaEaAPR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 May 2014 20:15:17 -0400
In-Reply-To: <CALCETrWgfRiknJTQtDSAavF1695NDy-h-DW1big+65-HmEOtwg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Josh Boyer <jwboyer@fedoraproject.org>, Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 05/30/2014 01:34 PM, Andy Lutomirski wrote:
>>
>> GET_LE() then?
> 
> Sounds good.
> 
> Are you planning on writing the patch?
> 
> I think my v2 is good -- the only diff I could find in my image.c
> files and Stephen's was in the alt_xyz output, and I think I fixed
> that in v2.
> 

Build testing one now.

	-hpa
