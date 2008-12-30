From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: RE: Pull request for FS-Cache, including NFS patches
Date: Tue, 30 Dec 2008 18:17:36 -0500
Message-ID: <1230679056.11508.37.camel@heimdal.trondhjem.org>
References: <7A24DF798E223B4C9864E8F92E8C93EC01AAFE6E@SACMVEXC1-PRD.hq.netapp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nfsv4-bounces@linux-nfs.org>
In-Reply-To: <7A24DF798E223B4C9864E8F92E8C93EC01AAFE6E@SACMVEXC1-PRD.hq.netapp.com>
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

On Tue, 2008-12-30 at 15:00 -0800, Muntz, Daniel wrote:
> Yes, and if you have a single user on the machine at a time (with cache
> flushed inbetween, kernel refreshed), root can read /dev/kmem, swap,
> intercept traffic and read cachefs data to its heart's content--hence,
> those requirements.

Unless you _are_ root and can check every executable, after presumably
rebooting into your own trusted kernel, then those requirements won't
mean squat. If you're that paranoid, then you will presumably also be
using a cryptfs-encrypted partition for cachefs, which you unmount when
you're not logged in.

That said, most cluster environments will tend to put most of their
security resources into keeping untrusted users out altogether. The
client nodes tend to be a homogeneous lot with presumably only a trusted
few sysadmins...

Trond

> -----Original Message-----
> From: Trond Myklebust [mailto:trond.myklebust@fys.uio.no] 
> Sent: Tuesday, December 30, 2008 2:36 PM
> To: Muntz, Daniel
> Cc: Andrew Morton; Stephen Rothwell; Bernd Schubert;
> nfsv4@linux-nfs.org; linux-kernel@vger.kernel.org; steved@redhat.com;
> dhowells@redhat.com; linux-next@vger.kernel.org;
> linux-fsdevel@vger.kernel.org; rwheeler@redhat.com
> Subject: RE: Pull request for FS-Cache, including NFS patches
> 
> On Tue, 2008-12-30 at 14:15 -0800, Muntz, Daniel wrote:
> > >> As for security, look at what MIT had to do to prevent local disk 
> > >> caching from breaking the security guarantees of AFS.
> > >
> > >See what David has added to the LSM code to provide the same 
> > >guarantees
> > for cachefs...
> > >
> > >Trond
> > 
> > Unless it (at least) leverages TPM, the issues I had in mind can't 
> > really be addressed in code.  One requirement is to prevent a local 
> > root user from accessing fs information without appropriate
> permissions.
> > This leads to unwieldly requirements such as allowing only one user on
> 
> > a machine at a time, blowing away the cache on logout, validating 
> > (e.g.,
> > refreshing) the kernel on each boot, etc.  Sure, some applications 
> > won't care, but you're also potentially opening holes that users may 
> > not consider.
> 
> You can't prevent a local root user from accessing cached data: that's
> true with or without cachefs. root can typically access the data using
> /dev/kmem, swap, intercepting tty traffic, spoofing user creds,...
> If root can't be trusted, then find another machine.
> 
> The worry is rather that privileged daemons may be tricked into
> revealing said data to unprivileged users, or that unprivileged users
> may attempt to read data from files to which they have no rights using
> the cachefs itself. That is a problem that is addressable by means of
> LSM, and is what David has attempted to solve.
> 
>   Trond
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
