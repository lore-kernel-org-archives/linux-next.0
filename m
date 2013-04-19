From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Fri, 19 Apr 2013 10:47:56 +0100
Message-ID: <1366364876.3077.51.camel@hornet>
References: <20130419172753.0e604e9bad0b7a26a8b52787@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130419172753.0e604e9bad0b7a26a8b52787@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2013-04-19 at 08:27 +0100, Stephen Rothwell wrote:
> Hi Mike,
>=20
> Today's linux-next merge of the clk tree got a conflict in
> arch/arm/mach-vexpress/v2m.c between commit dabfd8fb84ab ("ARM: vexpr=
ess:
> remove sp804 OF init") from the arm-soc tree and commit 6e973d2c4385
> ("clk: vexpress: Add separate SP810 driver") from the clk tree.
>=20
> I fixed it up (I thnk - see below) and can carry the fix as necessary=
 (no
> action is required).

Yep, this merge is fine, thanks!

Pawe=C5=82
