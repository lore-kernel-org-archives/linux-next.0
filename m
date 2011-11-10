From: Manuel Lauss <manuel.lauss@googlemail.com>
Subject: Re: [PATCH] MIPS/sound: DB1200 audio support depends on MIPS arch.
Date: Thu, 10 Nov 2011 12:46:16 +0100
Message-ID: <CAOLZvyFYH7s4NJwKTvr-_WrS6kLKBZvgH8ZOi07EUgcZ-U-PHg@mail.gmail.com>
References: <20111110122241.eed1e785e4c015a51b9ef585@canb.auug.org.au> <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:64912 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933922Ab1KJLq6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2011 06:46:58 -0500
In-Reply-To: <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: alsa-devel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Manuel Lauss <manuel.lauss@googlemail.com>

On Thu, Nov 10, 2011 at 12:20 PM, Manuel Lauss
<manuel.lauss@googlemail.com> wrote:
> DB1200 audio support should only be visible if MIPS/Alchemy arch is
> selected. =A0Fixes an x86-allmodconfig build failure in linux-next.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>

Please ignore this one.  This is caused by  a stray change in on the
Alchemy patches
for 3.3.   I'll send a fix to Ralf asap.

Manuel
