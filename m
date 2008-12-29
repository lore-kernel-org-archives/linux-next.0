From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Mon, 29 Dec 2008 09:30:56 -0500
Message-ID: <1230561056.7046.47.camel@heimdal.trondhjem.org>
References: <8930.1229560221@redhat.com> <20081218142420.GA16728@infradead.org>
	<20081218123601.11810b7f.akpm@linux-foundation.org>
	<200812190007.34581.bernd.schubert@fastmail.fm>
	<20081218152616.a24c013f.akpm@linux-foundation.org>
	<20081219110539.7e7e230c.sfr@canb.auug.org.au>
	<20081229144533.4a0ab696.sfr@canb.auug.org.au>
	<20081228200134.426bf203.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nfsv4-bounces@linux-nfs.org>
In-Reply-To: <20081228200134.426bf203.akpm@linux-foundation.org>
List-Unsubscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=unsubscribe>
List-Archive: <http://linux-nfs.org/pipermail/nfsv4>
List-Post: <mailto:nfsv4@linux-nfs.org>
List-Help: <mailto:nfsv4-request@linux-nfs.org?subject=help>
List-Subscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=subscribe>
Sender: nfsv4-bounces@linux-nfs.org
Errors-To: nfsv4-bounces@linux-nfs.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, linux-kernel@vger.kernel.org, steved@redhat.com, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com
List-Id: linux-next.vger.kernel.org

On Sun, 2008-12-28 at 20:01 -0800, Andrew Morton wrote:
> On Mon, 29 Dec 2008 14:45:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi David,
> > 
> > On Fri, 19 Dec 2008 11:05:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Given the ongoing discussions around FS-Cache, I have removed it from
> > > linux-next.  Please ask me to include it again (if sensible) once some
> > > decision has been reached about its future.
> > 
> > What was the result of discussions around FS-Cache?
> 
> There was none.
> 
> Dan Muntz's question:
> 
>   Solaris has had CacheFS since ~1995, HPUX had a port of it since
>   ~1997.  I'd be interested in evidence of even a small fraction of
>   Solaris and/or HPUX shops using CacheFS.  I am aware of customers who
>   thought it sounded like a good idea, but ended up ditching it for
>   various reasons (e.g., CacheFS just adds overhead if you almost
>   always hit your local mem cache).
> 
> was an very very good one.
> 
> Seems that instead of answering it, we've decided to investigate the
> fate of those who do not learn from history.

David has given you plenty of arguments for why it helps scale the
server (including specific workloads), has given you numbers validating
his claim, and has presented claims that Red Hat has customers using
cachefs in RHEL-5.
The arguments I've seen against it, have so far been:

     1. Solaris couldn't sell their implementation
     2. It's too big
     3. It's intrusive

Argument (1) has so far appeared to be pure FUD. In order to discuss the
lessons of history, you need to first do the work of analysing and
understanding it first. I really don't see how it is relevant to Linux
whether or not the Solaris and HPUX cachefs implementations worked out
unless you can demonstrate that that their experience shows some fatal
flaw in the arguments and numbers that David presented, and that his
customers are deluded.
If you want examples of permanent caches that clearly do help servers
scale, then look no further than the on-disk caches used in almost all
http browser implemantations. Alternatively, as David mentioned, there
are the on-disk caches used by AFS/DFS/coda.

(2) may be valid, but I have yet to see specifics for where you'd like
to see the cachefs code slimmed down. Did I miss them?

(3) was certainly true 3 years ago, when the code was first presented
for review, and so we did a review and critique then. The NFS specific
changes have improved greatly as a result, and as far as I know, the
security folks are happy too. If you're not happy with the parts that
affect the memory management code then, again, it would be useful to see
specifics that what you want changed.

If there is still controversy concerning this, then I can temporarily
remove cachefs from the nfs linux-next branch, but I'm definitely
keeping it in the linux-mm branch until someone gives me a reason for
why it shouldn't be merged in its current state.

Trond
