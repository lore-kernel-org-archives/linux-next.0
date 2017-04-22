From: Mason <slash.tmp@free.fr>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Sat, 22 Apr 2017 10:41:37 +0200
Message-ID: <f89b6045-8c09-f6c4-3893-84f172260926@free.fr>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <20170421181230.05dcf937@canb.auug.org.au>
 <20170421234315.GO17774@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170421234315.GO17774@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, arm-soc <arm@kernel.org>, Emilio Lopez <emilio@elopez.com.ar>, LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-next <linux-next@vger.kernel.org>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On 22/04/2017 01:43, Russell King - ARM Linux wrote:

> Or I drop the offending patch (done) and we get the DMA subsystem fixed
> first.  Given how long it's been this way, I doubt there's any hurry to
> get this change in for the next merge window.

Your solution makes sense.

Vinod, could you apply [PATCH v2] dmaengine: sun4i: fix invalid argument
to your tree when you have the time?

Regards.
