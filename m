From: Joerg Roedel <jroedel@suse.de>
Subject: Re: next-20160620 build: 2 failures 9 warnings (next-20160620)
Date: Mon, 20 Jun 2016 15:52:41 +0200
Message-ID: <20160620135241.GN29948@suse.de>
References: <E1bEwGe-0004DR-4p@optimist> <20160620134200.GU26099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160620134200.GU26099@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org

On Mon, Jun 20, 2016 at 02:42:00PM +0100, Mark Brown wrote:
> On Mon, Jun 20, 2016 at 11:17:20AM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build due to:
> 
> > 	arm64-allmodconfig
> > ../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory
> 
> which is triggered by da4d6e6d3b3ef (iommu/mediatek: Convert DT
> component matching to component_match_add_release()) - there is
> presumably a dependency on some other patch series that is still in
> review.

Yes, this came to my attention already. I will remove that patch from
the iommu tree.


Thanks,

	Joerg
