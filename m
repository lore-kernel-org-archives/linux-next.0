From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: manual merge of the amlogic tree with the arm-soc tree
Date: Wed, 18 Jan 2017 11:06:53 -0800
Message-ID: <m2inpc192q.fsf@baylibre.com>
References: <20170118095531.37f33df0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170118095531.37f33df0@canb.auug.org.au> (Stephen Rothwell's
 message of "Wed, 18 Jan 2017 09:55:31 +1100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, Carlo Caione <carlo@caione.org>, ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the amlogic tree got a conflict in:
>
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>
> between commit:
>
>   f7bcd4b6f698 ("ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS")
>
> from the arm-soc tree and commit:
>
>   47961f1353b8 ("ARM64: dts: meson-gx: move the SCPI and SRAM nodes to meson-gx")
>
> from the amlogic tree.

The latter has been dropped from the amlogic pending some ongoing
discussion, but I forgot to push an updated for-next. That's remedied
now.

Kevin
