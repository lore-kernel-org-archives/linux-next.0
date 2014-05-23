From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] sound branch of STMPE cleanups
Date: Fri, 23 May 2014 10:59:11 +0200
Message-ID: <CACRpkdaWOCxyoVoPo+sUfP5K-QJ3gSr+sfz+iiSOQChtVCeyNA@mail.gmail.com>
References: <CACRpkdZTez-OJgjNV8jKxgFEXhyXdsnv5bwSdLH_dRfok1u24g@mail.gmail.com>
	<20140523083208.GM19747@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140523083208.GM19747@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 23, 2014 at 10:32 AM, Lee Jones <lee.jones@linaro.org> wrote:

> Nope, this branch is broken too.  I don't think this is a merge error,
> I think it's programmer error (even the greats make mistakes =:-) ).

Yeah you're right :-( :-(

Sorry for the mess.

> In the mean time, it might be worth you looking at your build system,
> as it seems to be overlooking drivers/mfd/stmpe.c.

This indeed seems to be the problem.

Thanks for covering up my stupid mistakes, I owe you one.

Yours,
Linus Walleij
