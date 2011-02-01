From: Anand Gadiyar <gadiyar@ti.com>
Subject: RE: linux-next-20100201 - OMAP2+ defconfig broken withCONFIG_DEBUG_LL
Date: Tue, 1 Feb 2011 14:55:01 +0530
Message-ID: <65ee8ac703eaa856dff7957d7966b627@mail.gmail.com>
References: <AANLkTinF+dpKvuRztChBM01MAjgL-foGp_yVq3uC9ghu@mail.gmail.com>
	<20110201092238.GA31015@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110201092238.GA31015@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Russell King - ARM Linux wrote:
> On Tue, Feb 01, 2011 at 11:09:52AM +0530, Gadiyar, Anand wrote:
> > Hi all,
> >
> > I tried to build linux-next as of 20100201 with omap2plus_defconfig.
In addition
> > I turned on CONFIG_DEBUG_LL and hit the following error.
>
> No need to bisect.  Tony knows about it.  It's the OMAP debug code using
> what was a macro in assembly, which becomes a C function with the
dynamic
> P2V patches.
>


Okay, thanks!

- Anand
