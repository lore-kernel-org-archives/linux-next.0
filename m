From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] USB: isp1362: fix build warnings on 64-bit systems
Date: Tue, 6 Oct 2009 04:32:29 -0400
Message-ID: <8bd0f97a0910060132r1dd6b6a4u71eaa8763862aebd@mail.gmail.com>
References: <1250046053-3097-1-git-send-email-vapier@gentoo.org>
	<20090813234410.GB4406@kroah.com> <8bd0f97a0908131734h2588d240k9000bace38b58e7f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756573AbZJFId2@vger.kernel.org>
In-Reply-To: <8bd0f97a0908131734h2588d240k9000bace38b58e7f@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lothar Wassmann <LW@karo-electronics.de>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 13, 2009 at 20:34, Mike Frysinger wrote:
> On Thu, Aug 13, 2009 at 19:44, Greg KH wrote:
>> On Tue, Aug 11, 2009 at 11:00:53PM -0400, Mike Frysinger wrote:
>>> A bunch of places assumed pointers were 32-bits in size (bit checking and
>>> debug output), but none of these affected runtime functionality.
>>>
>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>>
>> This patch doesn't apply to my tree, what did you make it against?
>
> it was reported against next, so i used that

so what tree do i need to use to get you to merge this ?  i'm guessing
the semantic patch was what caused conflicts (my proposed patch
already included that fix, but too late now).
-mike
