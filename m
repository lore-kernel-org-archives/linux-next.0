From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] Fix compiler warnings and remove debug messages
Date: Tue, 11 Aug 2009 03:59:43 -0400
Message-ID: <8bd0f97a0908110059y344071adn3656eaea3d7edddf@mail.gmail.com>
References: <20090810193653.f228cf06.sfr@canb.auug.org.au>
	<1249921736508-git-send-email-LW@KARO-electronics.de> <20090811000112.GB13314@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753547AbZHKMQ4@vger.kernel.org>
In-Reply-To: <20090811000112.GB13314@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Lothar Wassmann <LW@karo-electronics.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Bryan Wu <cooloney@kernel.org>, Lothar Wassmann <lothar@ipc1.ka-ro>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 10, 2009 at 20:01, Greg KH wrote:
> On Mon, Aug 10, 2009 at 06:28:56PM +0200, Lothar Wassmann wrote:
>> This patch fixes the reported compiler warnings and removes excessiv=
e debug messages.
>> Compile tested only!
>
> I'd prefer the correct fixes for this driver. =C2=A0Mike, any thought=
s on
> some fixes for this?

if it's simply fixing printf modifiers, then i can send out a patch for=
 that.

the changelog simply states "the reported compiler warnings" ... what
exactly must i do to reproduce these ?
-mike
