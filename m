From: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 21 Aug 2013 14:30:04 +0800
Message-ID: <52145E6C.80404@ozlabs.org>
References: <20130820172052.1f0d89ddf6a1a40ef70333fd@canb.auug.org.au>
	<20130820120702.000b044e@oracle.com>
	<201308202246.30869.arnd@arndb.de>
	<20130821010822.220f592a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
In-Reply-To: <20130821010822.220f592a@oracle.com>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Dwight Engen <dwight.engen@oracle.com>
Cc: cbe-oss-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, Ben Myers <bpm@sgi.com>, linux-next@vger.kernel.org, Gao feng <gaofeng@cn.fujitsu.com>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

Hi all,

> Yes, I agree. The other filesystems that take an Opt_uid as well do use
> current_user_ns() and not init_user_ns. They also do a uid_valid()
> check and fail the mount (or fallback to GLOBAL_ROOT_UID). So I think
> that would look like this:

Looks good to me. Builds and mounts as expected.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
