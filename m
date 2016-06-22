From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build warnings after merge of the kspp tree
Date: Wed, 22 Jun 2016 10:10:13 -0700
Message-ID: <CAGXu5jJe5G5N9BJeB3dr0hKF+A0NOLT5OjQDOpMwko4fHr4OwA@mail.gmail.com>
References: <20160622151442.5684f922@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35881 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257AbcFVRKQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2016 13:10:16 -0400
Received: by mail-wm0-f43.google.com with SMTP id f126so96070482wma.1
        for <linux-next@vger.kernel.org>; Wed, 22 Jun 2016 10:10:15 -0700 (PDT)
In-Reply-To: <20160622151442.5684f922@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

On Tue, Jun 21, 2016 at 10:14 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> After merging the kspp tree, today's linux-next build (i386 defconfig)
> produced these warning:
>
> x86_64-linux-gcc: warning: '-mcpu=' is deprecated; use '-mtune=' or '-march=' instead
>
> (over 2000 of these)
>
> Introduced (maybe) by commit
>
>   e2135c84d5d2 ("kbuild: no gcc-plugins during cc-option tests")

I will investigate.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
