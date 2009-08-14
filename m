From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] USB: isp1362: fix build warnings on 64-bit systems
Date: Thu, 13 Aug 2009 20:34:40 -0400
Message-ID: <8bd0f97a0908131734h2588d240k9000bace38b58e7f@mail.gmail.com>
References: <1250046053-3097-1-git-send-email-vapier@gentoo.org>
	<20090813234410.GB4406@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.211.193]:40144 "EHLO
	mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753597AbZHNAfA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2009 20:35:00 -0400
In-Reply-To: <20090813234410.GB4406@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lothar Wassmann <LW@karo-electronics.de>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Aug 13, 2009 at 19:44, Greg KH wrote:
> On Tue, Aug 11, 2009 at 11:00:53PM -0400, Mike Frysinger wrote:
>> A bunch of places assumed pointers were 32-bits in size (bit checking and
>> debug output), but none of these affected runtime functionality.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>
> This patch doesn't apply to my tree, what did you make it against?

it was reported against next, so i used that
-mike
