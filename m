From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: writable limits into -next
Date: Tue, 20 Jul 2010 10:08:34 +0200
Message-ID: <4C455982.1000800@gmail.com>
References: <4C448344.9020807@gmail.com> <20100720110814.ffe72bc0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:54768 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752884Ab0GTIIj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2010 04:08:39 -0400
In-Reply-To: <20100720110814.ffe72bc0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 07/20/2010 03:08 AM, Stephen Rothwell wrote:
>> There will be merge conflicts in unistd files with "unistd: add
>> __NR_prlimit64 syscall numbers". You can take a look at
>> http://decibel.fi.muni.cz/cgi-bin/gitweb.cgi?p=mm.git;a=shortlog;h=refs/heads/devel
>> to see how it looks like in -next.
> 
> Not sure how this is useful as it is your mm tree?

Hi, feel free to ignore it. It was intended just as a hint how the
conflicts may be resolved.

thanks,
-- 
js
