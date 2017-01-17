From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Tue, 17 Jan 2017 14:53:23 -0800
Message-ID: <e76ccd27-ce3b-d9e3-42c7-80586c34de18@gmail.com>
References: <20170118094929.7d79bb55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170118094929.7d79bb55@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Russell King <rmk@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 01/17/2017 02:49 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in:
> 
>   arch/arm/mach-ux500/platsmp.c
> 
> between commit:
> 
>   6996cbb23721 ("ARM: 8641/1: treewide: Replace uses of virt_to_phys with __pa_symbol")
> 
> from the arm tree and commit:
> 
>   9e634cae7256 ("ARM: ux500: simplify secondary boot")
> 
> from the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Your resolution looks correct, thanks Stephen!
-- 
Florian
