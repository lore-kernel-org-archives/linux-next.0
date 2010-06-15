From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: linux-next: manual merge of the battery tree with the arm-current
	tree
Date: Tue, 15 Jun 2010 14:54:58 +0800
Message-ID: <AANLkTilwnVs1970j0DkobtpyDKY8mOX9EX6iFP2uSvYR@mail.gmail.com>
References: <20100615125512.09c79d9b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100615125512.09c79d9b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Russell King <rmk@arm.linux.org.uk>, Huang Weiyi <weiyi.huang@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 15, 2010 at 10:55 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi Anton,
>
> Today's linux-next merge of the battery tree got a conflict in
> drivers/power/z2_battery.c between commit
> 56b925fccc58cd43fc553a8302dbbdd440aef288 ("[ARM] pxa/z2: fix missing
> include in battery driver") from the arm-current tree and commit
> 5d111107b7994349feb681466f873b1a4f8a09d6 ("z2_battery: Remove duplica=
ted
> #include") from the battery tree.
>
> The former is a superset of the latter.

Marek has submitted a revised patch which goes into the -pxa tree
due to dependency of z2_battery and some of the pxa machine files.

Anton,

Any suggestion? Or if you feel OK for this to go through the -pxa tree,=
 I'd
like to have your Ack.

> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
