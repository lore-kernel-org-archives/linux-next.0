From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: Tree for November 17 (exofs)
Date: Tue, 17 Nov 2009 19:08:09 +0200
Message-ID: <4B02D879.4010403@panasas.com>
References: <20091117195309.6cc3ead0.sfr@canb.auug.org.au> <20091117090248.bb66c230.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:58794 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754236AbZKQRIO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2009 12:08:14 -0500
In-Reply-To: <20091117090248.bb66c230.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 11/17/2009 07:02 PM, Randy Dunlap wrote:
> On Tue, 17 Nov 2009 19:53:09 +1100 Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Changes since 20091116:
> 
> 
> on i386 (X86_32):
> 
> fs/built-in.o: In function `exofs_sbi_read':
> (.text+0x592964): undefined reference to `__umoddi3'
> 
> ---
> ~Randy

exofs_sbi_read is a totally simple loop thing. What does the
__umoddi3 means? Please help?

Boaz
