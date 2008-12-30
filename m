From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: RE: Pull request for FS-Cache, including NFS patches
Date: Tue, 30 Dec 2008 13:44:36 -0500
Message-ID: <1230662677.4952.37.camel@heimdal.trondhjem.org>
References: <7A24DF798E223B4C9864E8F92E8C93EC01AAFE24@SACMVEXC1-PRD.hq.netapp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nfsv4-bounces@linux-nfs.org>
In-Reply-To: <7A24DF798E223B4C9864E8F92E8C93EC01AAFE24@SACMVEXC1-PRD.hq.netapp.com>
List-Unsubscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=unsubscribe>
List-Archive: <http://linux-nfs.org/pipermail/nfsv4>
List-Post: <mailto:nfsv4@linux-nfs.org>
List-Help: <mailto:nfsv4-request@linux-nfs.org?subject=help>
List-Subscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=subscribe>
Sender: nfsv4-bounces@linux-nfs.org
Errors-To: nfsv4-bounces@linux-nfs.org
To: "Muntz, Daniel" <Dan.Muntz@netapp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, steved@redhat.com, linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, rwheeler@redhat.com
List-Id: linux-next.vger.kernel.org

On Mon, 2008-12-29 at 15:05 -0800, Muntz, Daniel wrote:
> Before throwing the 'FUD' acronym around, maybe you should re-read the
> details.  My point was that there were few users of cachefs even when
> the technology had the potential for greater benefit (slower networks,
> less powerful servers, smaller memory caches).  Obviously cachefs can
> improve performance--it's simply a function of workload and the
> assumptions made about server/disk/network bandwidth.  However, I would
> expect the real benefits and real beneficiaries to be fewer than in the
> past.  HOWEVER^2 I did provide some argument(s) in favor of adding
> cachefs, and look forward to extensions to support delayed write,
> offline operation, and NFSv4 support with real consistency checking (as
> long as I don't have to take the customer calls ;-).  BTW,
> animation/video shops were one group that did benefit, and I imagine
> they still could today (the one I had in mind did work across Britain,
> the US, and Asia and relied on cachefs for overcoming slow network
> connections).  Wonder if the same company is a RH customer...

I did read your argument. My point is that although the argument sounds
reasonable, it ignores the fact that the customer bases are completely
different. The people asking for cachefs on Linux typically run a
cluster of 2000+ clients all accessing the same read-only data from just
a handful of servers. They're primarily looking to improve the
performance and stability of the _servers_, since those are the single
point of failure of the cluster.

As far as I know, historically there has never been a market for 2000+
HP-UX, or even Solaris based clusters, and unless the HP and Sun product
plans change drastically, then simple economics dictates that nor will
there ever be such a market, whether or not they have cachefs support.

OpenSolaris is a different kettle of fish since it has cachefs, and does
run on COTS hardware, but there are other reasons why that hasn't yet
penetrated the HPC market.

> All the comparisons to HTTP browser implementations are, imho, absurd.
> It's fine to keep a bunch of http data around on disk because a) it's RO
> data, b) correctness is not terribly important, and c) a human is
> generally the consumer and can manually request non-cached data if
> things look wonky.  It is a trivial case of caching.

See above. The majority of people I'm aware of that have been asking for
this are interested mainly in improving read-only workloads for data
that changes infrequently. Correctness tends to be important, but the
requirements are no different from those that apply to the page cache.
You mentioned the animation industry: they are prime example of an
industry that satisfies (a), (b), and (c). Ditto the oil and gas
exploration industry, as well as pretty much all scientific computing,
to mention only a few examples...

> As for security, look at what MIT had to do to prevent local disk
> caching from breaking the security guarantees of AFS.

See what David has added to the LSM code to provide the same guarantees
for cachefs...

Trond
