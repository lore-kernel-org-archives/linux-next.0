From: Ben Myers <bpm@sgi.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 21 Aug 2013 10:56:54 -0500
Message-ID: <20130821155654.GI5262@sgi.com>
References: <20130820172052.1f0d89ddf6a1a40ef70333fd@canb.auug.org.au>
	<20130820120702.000b044e@oracle.com>
	<201308202246.30869.arnd@arndb.de>
	<20130821010822.220f592a@oracle.com> <52145E6C.80404@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <52145E6C.80404@ozlabs.org>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Jeremy Kerr <jk@ozlabs.org>
Cc: cbe-oss-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dwight Engen <dwight.engen@oracle.com>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, linux-next@vger.kernel.org, Gao feng <gaofeng@cn.fujitsu.com>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

Hey Dwight,

On Wed, Aug 21, 2013 at 02:30:04PM +0800, Jeremy Kerr wrote:
> > Yes, I agree. The other filesystems that take an Opt_uid as well do use
> > current_user_ns() and not init_user_ns. They also do a uid_valid()
> > check and fail the mount (or fallback to GLOBAL_ROOT_UID). So I think
> > that would look like this:
> 
> Looks good to me. Builds and mounts as expected.
> 
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Could you repost this patch with the right subject and a commit header?  Given
Jeremy's Ack I think we could proceed to pull this in.

Regards,
	Ben

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
