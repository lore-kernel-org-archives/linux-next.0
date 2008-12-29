From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Sun, 28 Dec 2008 20:07:26 -0800
Message-ID: <20081228200726.7b7078b4.akpm@linux-foundation.org>
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

> I ask because it
> reappeared in linux-next today via the nfs tree (merged into that on Dec
> 24 and 25) ...

And that of course means that many many 2.6.28 patches which I am
maintaining will need significant rework to apply on top of linux-next,
and then they won't apply to mainline.  Or that linux-next will not apply
on top of those patches.  Mainly memory management.

Please drop the NFS tree until after -rc1.

Guys, this: http://lkml.org/lkml/2008/12/27/173
