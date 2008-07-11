From: Joel Becker <Joel.Becker@oracle.com>
Subject: Re: [BUGFIX][PATCH v2 0/2] configfs: Fix cleanup
	after mkdir()	failure
Date: Fri, 11 Jul 2008 16:37:26 -0700
Message-ID: <20080711233726.GD22577@mail.oracle.com>
References: <1215183366-17479-1-git-send-email-louis.rilling@kerlabs.com>
	<20080711220740.GC22577@mail.oracle.com>
	<20080711155238.f3e257b0.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ocfs2-devel-bounces@oss.oracle.com>
Content-Disposition: inline
In-Reply-To: <20080711155238.f3e257b0.akpm@linux-foundation.org>
List-Unsubscribe: <http://oss.oracle.com/mailman/listinfo/ocfs2-devel>,
	<mailto:ocfs2-devel-request@oss.oracle.com?subject=unsubscribe>
List-Archive: <http://oss.oracle.com/pipermail/ocfs2-devel>
List-Post: <mailto:ocfs2-devel@oss.oracle.com>
List-Help: <mailto:ocfs2-devel-request@oss.oracle.com?subject=help>
List-Subscribe: <http://oss.oracle.com/mailman/listinfo/ocfs2-devel>,
	<mailto:ocfs2-devel-request@oss.oracle.com?subject=subscribe>
Sender: ocfs2-devel-bounces@oss.oracle.com
Errors-To: ocfs2-devel-bounces@oss.oracle.com
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ocfs2-devel@oss.oracle.com
List-Id: linux-next.vger.kernel.org

On Fri, Jul 11, 2008 at 03:52:38PM -0700, Andrew Morton wrote:
> On Fri, 11 Jul 2008 15:07:40 -0700 Joel Becker <Joel.Becker@oracle.com> wrote:
> 
> > 	Ok, I've merged all this work.  Please check out my configfs-ALL
> > branch and make sure I have everything we've worked on.
> > 
> > http://oss.oracle.com/git/?p=jlbec/linux-2.6.git;a=shortlog;h=configfs-ALL
> > git://oss.oracle.com/git/jlbec/linux-2.6.git configfs-ALL
> 
> Can you please arrange to get this tree into linux-next?

Hey Andrew,
	I still send configfs stuff through ocfs2.git (it's just
easier).  The first half of these changes have been in linux-next for
about three weeks.  We'll be sending the rest there as soon as Louis
verifies I didn't miss anything :-)

Joel

-- 

"We will have to repent in this generation not merely for the
 vitriolic words and actions of the bad people, but for the 
 appalling silence of the good people."
	- Rev. Dr. Martin Luther King, Jr.

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
