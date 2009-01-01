From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Thu, 1 Jan 2009 09:09:00 +0100
Message-ID: <20090101090900.551ada4a@infradead.org>
References: <1230679056.11508.37.camel@heimdal.trondhjem.org>
	<7A24DF798E223B4C9864E8F92E8C93EC01BD14BB@SACMVEXC1-PRD.hq.netapp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <7A24DF798E223B4C9864E8F92E8C93EC01BD14BB@SACMVEXC1-PRD.hq.netapp.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Muntz, Daniel" <Dan.Muntz@netapp.com>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, linux-kernel@vger.kernel.org, steved@redhat.com, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com
List-Id: linux-next.vger.kernel.org

On Wed, 31 Dec 2008 20:11:13 -0800
"Muntz, Daniel" <Dan.Muntz@netapp.com> wrote:

please don't top post.

> Sure, trusted kernel and trusted executables,  but it's easier than it
> sounds.  If you start with a "clean" system, you don't need to verify
> excutables _if_ they're coming from the secured file server (by
> induction: if you started out secure, the executables on the file
> server will remain secure).  You simply can't trust the local disk
> from one user to the next.  Following the protocol, a student can log
> into a machine, su to do their OS homework, but not compromise the
> security of the distributed file system.
> 
> If I can su while another user is logged in, or the kernel/cmds are
> not validated between users, cryptfs isn't safe either.
> 
> If you're following the protocol, it doesn't even matter if a bad guy
> ("untrusted user"?) gets root on the client--they still can't gain
> inappropriate access to the file server.  OTOH, if my security plan is
> simply to not allow root access to untrusted users, history says I'm
> going to lose.

if you have a user, history says you're going to lose.

you can make your system as secure as you want, with physical access
all bets are off.
keyboard sniffer.. easy.
special dimms that mirror data... not even all THAT hard, just takes a
bit of cash.
running the user in a VM without him noticing.. not too hard either.
etc.


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
