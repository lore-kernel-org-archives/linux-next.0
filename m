From: Mark Fasheh <mfasheh@suse.com>
Subject: Re: [PATCH -next] ocfs2: fix printk format warnings
	with OCFS2_FS_STATS=n
Date: Wed, 28 May 2008 14:48:57 -0700
Message-ID: <20080528214857.GG8325@wotan.suse.de>
References: <20080528144100.13ec8c6a.randy.dunlap@oracle.com>
Reply-To: Mark Fasheh <mfasheh@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ocfs2-devel-bounces@oss.oracle.com>
Content-Disposition: inline
In-Reply-To: <20080528144100.13ec8c6a.randy.dunlap@oracle.com>
List-Unsubscribe: <http://oss.oracle.com/mailman/listinfo/ocfs2-devel>,
	<mailto:ocfs2-devel-request@oss.oracle.com?subject=unsubscribe>
List-Archive: <http://oss.oracle.com/pipermail/ocfs2-devel>
List-Post: <mailto:ocfs2-devel@oss.oracle.com>
List-Help: <mailto:ocfs2-devel-request@oss.oracle.com?subject=help>
List-Subscribe: <http://oss.oracle.com/mailman/listinfo/ocfs2-devel>,
	<mailto:ocfs2-devel-request@oss.oracle.com?subject=subscribe>
Sender: ocfs2-devel-bounces@oss.oracle.com
Errors-To: ocfs2-devel-bounces@oss.oracle.com
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, ocfs2-devel@oss.oracle.com
List-Id: linux-next.vger.kernel.org

On Wed, May 28, 2008 at 02:41:00PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix printk format warnings when OCFS2_FS_STATS=n:
> 
> linux-next-20080528/fs/ocfs2/dlmglue.c: In function 'ocfs2_dlm_seq_show':
> linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 3 has type 'int'
> linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 4 has type 'int'
> linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 7 has type 'int'
> linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 8 has type 'int'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks Randy...
	--Mark

--
Mark Fasheh
