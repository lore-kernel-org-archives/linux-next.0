From: Aleksey Senin <alekseys@voltaire.com>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 10:48:19 +0200
Message-ID: <1230540499.4261.24.camel@alst60>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Roland Dreier <rdreier@cisco.com>, linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

I'm going to change it by adding 

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)

exactly as it solved in ipoib module and as Roland says.

On Mon, 2008-12-29 at 11:43 +1100, Stephen Rothwell wrote:
> Hi Roland,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> ERROR: ".ipv6_chk_addr" [drivers/infiniband/core/ib_addr.ko] undefined!
> ERROR: ".ip6_route_output" [drivers/infiniband/core/ib_addr.ko] undefined!
> 
> Caused by commit 38617c64bf9a10bf20e41d95b69bb81e8560fe9d ("RDMA/addr:
> Add support for translating IPv6 addresses").  This requires a dependency
> on IPV6.
> 
> I have reverted that commit for today (which fixes the build, but may not
> be the correct solution).
