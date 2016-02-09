From: Eric Sandeen <sandeen@sandeen.net>
Subject: Re: linux-next: build failure after merge of the xfs tree
Date: Mon, 8 Feb 2016 18:30:40 -0600
Message-ID: <56B93330.20608@sandeen.net>
References: <20160209111721.359f8558@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
In-Reply-To: <20160209111721.359f8558@canb.auug.org.au>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Dave just sent a patch to the xfs list to fix this,

[PATCH] xfs: log recovery needs to be aware of CONFIG_XFS_RT now

Thanks,
-Eric


On 2/8/16 6:17 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: "xfs_rtbuf_ops" [fs/xfs/xfs.ko] undefined!
> 
> Caused by commit
> 
>   ca4de5c7e86a ("xfs: RT bitmap and summary buffers need verifiers")
> 
> CONFIG_XFS_RT is not set for this build.
> 
> I have used the xfs tree from next-20160208 for today.
> 

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
