From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the omap tree with the arm-soc tree
Date: Tue, 20 Jan 2015 10:40:03 -0800
Message-ID: <20150120184002.GM7718@atomide.com>
References: <20150120110947.1a92a416@canb.auug.org.au>
 <20150120171048.GF7718@atomide.com>
 <CAOesGMjc+q5ZEFU4GugJT2RCSmhv48DAA8JzuCxf63eEO6tWVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjc+q5ZEFU4GugJT2RCSmhv48DAA8JzuCxf63eEO6tWVQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Peter Robinson <pbrobinson@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

* Olof Johansson <olof@lixom.net> [150120 10:27]:
> On Tue, Jan 20, 2015 at 9:10 AM, Tony Lindgren <tony@atomide.com> wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> [150119 16:12]:
> >> Hi Tony,
> >>
> >> Today's linux-next merge of the omap tree got a conflict in
> >> arch/arm/boot/dts/Makefile between commit cb612390e546 ("ARM: dts: Only
> >> build dtb if associated Arch and/or SoC is enabled") from the arm-soc
> >> tree and commit ac7452cee743 ("ARM: dts: Add minimal support for
> >> dm8168-evm") from the omap tree.
> >>
> >> I fixed it up (see below) and can carry the fix as necessary (no action
> >> is required).
> >
> > Uhh why is cb612390e546 doing formatting changes all over the place?
> > That's a sure way to produce merge conflicts..
> 
> It's intentional but a but annoying, yes -- we're resolving them as we
> merge in new DT contents so it won't be exposed outside of our tree
> (and -next, unfortunately).

OK. I don't have anything against cleaning up and sorting things to
avoid merge conflicts naturally :)

Maybe for other similar changes you can set up an immutable branch
abainst v3.xx-rc1 with just the clean-up that people can use as
a base without having to bring in all the other changes?

Regards,

Tony
