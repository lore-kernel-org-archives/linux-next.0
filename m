From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the xilinx tree
Date: Fri, 5 Apr 2013 15:32:45 +0200
Message-ID: <201304051532.46156.arnd@arndb.de>
References: <20130405153335.baf29606a97b1bee415f3546@canb.auug.org.au>
 <201304051409.37708.arnd@arndb.de>
 <CAHTX3d+PZ=G6JYBo7Hvqe=G77udaCFJ4pD4z_sQw_FDGP-xt=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHTX3d+PZ=G6JYBo7Hvqe=G77udaCFJ4pD4z_sQw_FDGP-xt=A@mail.gmail.com>
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
> > > Interesting. I rebased my arm-next branch based on 3.9-rc5
> > > with some Rob's + one Arnd patch from arm-soc - clksrc/cleanup branch.
> > >
> > > I will fix my arm-next branch.
> >
> > The for-next branch in arm-soc is not stable, you should never base
> > anything on it. If you depend on some stable branch, that is in arm-soc,
> > then use just that branch, not one of the next/* branches or for-next.
> >
> 
> I haven't based on arm-soc for-next branch my arm-next branch.
> I just took all patches I need for zynq and done git rebase v3.5-rc5.
> Which caused that I have became commuter of that 4 patches
> and there is probably any conflict between your for-next branch and
> clksrc/cleanup
> which you have resolved in for-next branch.

Ah, I see. That was actually my fault, I'm sorry for causing trouble
here and then accusing you instead.

> And because of my rebase sha1 are different that's why Stephen
> had problem with it.
> I have changed my arm-next branch and will see on Monday if Stephen
> will report any problem or not.

Ok, thanks!

	Arnd
