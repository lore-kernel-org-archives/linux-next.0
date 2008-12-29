From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Sun, 28 Dec 2008 20:01:34 -0800
Message-ID: <20081228200134.426bf203.akpm@linux-foundation.org>
References: <8930.1229560221@redhat.com> <20081218142420.GA16728@infradead.org>
	<20081218123601.11810b7f.akpm@linux-foundation.org>
	<200812190007.34581.bernd.schubert@fastmail.fm>
	<20081218152616.a24c013f.akpm@linux-foundation.org>
	<20081219110539.7e7e230c.sfr@canb.auug.org.au>
	<20081229144533.4a0ab696.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nfsv4-bounces@linux-nfs.org>
In-Reply-To: <20081229144533.4a0ab696.sfr@canb.auug.org.au>
List-Unsubscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=unsubscribe>
List-Archive: <http://linux-nfs.org/pipermail/nfsv4>
List-Post: <mailto:nfsv4@linux-nfs.org>
List-Help: <mailto:nfsv4-request@linux-nfs.org?subject=help>
List-Subscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=subscribe>
Sender: nfsv4-bounces@linux-nfs.org
Errors-To: nfsv4-bounces@linux-nfs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, steved@redhat.com, linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com
List-Id: linux-next.vger.kernel.org

On Mon, 29 Dec 2008 14:45:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi David,
> 
> On Fri, 19 Dec 2008 11:05:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Given the ongoing discussions around FS-Cache, I have removed it from
> > linux-next.  Please ask me to include it again (if sensible) once some
> > decision has been reached about its future.
> 
> What was the result of discussions around FS-Cache?

There was none.

Dan Muntz's question:

  Solaris has had CacheFS since ~1995, HPUX had a port of it since
  ~1997.  I'd be interested in evidence of even a small fraction of
  Solaris and/or HPUX shops using CacheFS.  I am aware of customers who
  thought it sounded like a good idea, but ended up ditching it for
  various reasons (e.g., CacheFS just adds overhead if you almost
  always hit your local mem cache).

was an very very good one.

Seems that instead of answering it, we've decided to investigate the
fate of those who do not learn from history.

>  I ask because it
> reappeared in linux-next today via the nfs tree (merged into that on Dec
> 24 and 25) ...

oh.
