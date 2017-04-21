From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Sat, 22 Apr 2017 00:43:16 +0100
Message-ID: <20170421234315.GO17774@n2100.armlinux.org.uk>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <20170421181230.05dcf937@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170421181230.05dcf937@canb.auug.org.au>
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
Cc: arm-soc <arm@kernel.org>, Mason <slash.tmp@free.fr>, Vinod Koul <vinod.koul@intel.com>, LKML <linux-kernel@vger.kernel.org>, Emilio Lopez <emilio.lopez@collabora.co.uk>, Chen-Yu Tsai <wens@csie.org>, linux-next <linux-next@vger.kernel.org>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 21, 2017 at 06:12:30PM +1000, Stephen Rothwell wrote:
> Hi Mason,
> 
> On Fri, 21 Apr 2017 09:58:58 +0200 Mason <slash.tmp@free.fr> wrote:
> >
> > Anyway, the fix is trivial.
> > 
> > The "pchans_used" field is an unsigned long array.
> > for_each_clear_bit_from() expects an unsigned long pointer,
> > not an array address.
> > 
> > I'll send a patch to the drivers/dma maintainers.
> 
> The fix really needs to go into the arm tree (as well?) since that is
> the tree that has the patch that causes the build to break (even if the
> actual bug was preexisting).

Or I drop the offending patch (done) and we get the DMA subsystem fixed
first.  Given how long it's been this way, I doubt there's any hurry to
get this change in for the next merge window.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
