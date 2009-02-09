From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [ofa-general] Re: linux-next: Tree for February 9 (infiniband)
Date: Mon, 09 Feb 2009 08:53:39 -0800
Message-ID: <49905F93.300@oracle.com>
References: <20090209193908.1a448944.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20090209193908.1a448944.sfr@canb.auug.org.au>
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
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, swise@chelsio.com
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> [I accidentally deleted the merge and quilt-import logs today :-( - I
> wonder if any would have noticed :-).  The merge summary still appears
> below.]
> 
> Changes since 20090206:


allyesconfig build on i386 fails with:

drivers/built-in.o: In function `iwch_sgl2pbl_map':
/usr/builds/linux-next-20090209/drivers/infiniband/hw/cxgb3/iwch_qp.c:237: undefined reference to `__umoddi3'
make: *** [.tmp_vmlinux1] Error 1


or allmodconfig on i386 fails with:

ERROR: "__umoddi3" [drivers/infiniband/hw/cxgb3/iw_cxgb3.ko] undefined!

-- 
~Randy
