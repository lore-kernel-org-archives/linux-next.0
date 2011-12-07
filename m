From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 7 Dec 2011 10:57:27 +0800
Message-ID: <CAAQ0ZWRQVTdPyp+_9da0kAEv8aYEL2MafA=qz0YOBWmWhfba0g@mail.gmail.com>
References: <20111207105252.25156be522cc26b520eac8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111207105252.25156be522cc26b520eac8f0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Lauri Hintsala <lauri.hintsala@bluegiga.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 7 December 2011 07:52, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
> Hi Arnd,
>
> Today's linux-next merge of the arm-soc tree got conflicts in
> arch/arm/mach-mxs/mach-m28evk.c and
> arch/arm/mach-mxs/mach-stmp378x_devb.c between commit d4e717535e94 ("=
ARM:
> restart: mxs: use new restart hook") from the arm tree and commit
> 8d2d2d1d7e96 ("ARM: mxs: fix machines' initializers order") from the
> arm-soc tree.
>
> Just context changes. =A0I fixed it up (see below) and can carry the =
fix as
> necessary.

The fix looks right.

Regards,
Shawn
