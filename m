From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd: make ofpart buildable as a separate module
Date: Mon, 27 Jun 2011 08:49:23 +0300
Message-ID: <1309153769.23597.15.camel@sauron>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-2-git-send-email-dbaryshkov@gmail.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1309122180-12838-2-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2011-06-27 at 01:02 +0400, Dmitry Eremin-Solenikov wrote:
> As ofpart now uses a standard mtd partitions parser interface, make it
> buildable as a separate module. Also provide MODULE_DESCRIPTION and
> MODULE_AUTHOR for this module.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Pushed this one to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
