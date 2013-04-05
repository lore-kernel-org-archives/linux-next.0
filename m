From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the xilinx tree
Date: Fri, 5 Apr 2013 14:09:37 +0200
Message-ID: <201304051409.37708.arnd@arndb.de>
References: <20130405153335.baf29606a97b1bee415f3546@canb.auug.org.au>
 <CAHTX3d+NK7b3RVMASZ4BARs1kHeVKGgxNwKTjAeiNB+44TPsFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHTX3d+NK7b3RVMASZ4BARs1kHeVKGgxNwKTjAeiNB+44TPsFg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Simek <monstr@monstr.eu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, John Linn <John.Linn@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Friday 05 April 2013, Michal Simek wrote:
> Hi,
> 
> 2013/4/5 Stephen Rothwell <sfr@canb.auug.org.au>
> 
> > Hi all,
> >
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > arch/arm/mach-spear/spear13xx.c between commit c79e33b3e828 ("ARM:
> > smp_twd: convert to use CLKSRC_OF init") from the xilinx tree and commit
> > 2b9c613c4ee1 ("ARM: spear: move generic.h and pl080.h into private dir")
> > from the arm-soc tree.
> >
> > I fixed it up (just used the arm-soc tree version) and can carry the fix
> > as necessary (no action is required).
> >  <sfr@canb.auug.org.au>
> 
> 
> Interesting. I rebased my arm-next branch based on 3.9-rc5
> with some Rob's + one Arnd patch from arm-soc - clksrc/cleanup branch.
> 
> I will fix my arm-next branch.

The for-next branch in arm-soc is not stable, you should never base
/anything/ on it. If you depend on some stable branch, that is in arm-soc,
then use just that branch, not one of the next/* branches or for-next.

	Arnd
