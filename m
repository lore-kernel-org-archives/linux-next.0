From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Wed, 31 Dec 2008 10:49:04 +0100
Message-ID: <20081231104904.5a89fc60@infradead.org>
References: <1230662677.4952.37.camel@heimdal.trondhjem.org>
	<7A24DF798E223B4C9864E8F92E8C93EC01AAFE66@SACMVEXC1-PRD.hq.netapp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <7A24DF798E223B4C9864E8F92E8C93EC01AAFE66@SACMVEXC1-PRD.hq.netapp.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Muntz, Daniel" <Dan.Muntz@netapp.com>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, linux-kernel@vger.kernel.org, steved@redhat.com, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com
List-Id: linux-next.vger.kernel.org

On Tue, 30 Dec 2008 14:15:42 -0800
"Muntz, Daniel" <Dan.Muntz@netapp.com> wrote:

> >> As for security, look at what MIT had to do to prevent local disk 
> >> caching from breaking the security guarantees of AFS.
> >
> >See what David has added to the LSM code to provide the same
> >guarantees
> for cachefs...
> >
> >Trond
> 
> Unless it (at least) leverages TPM, the issues I had in mind can't
> really be addressed in code.  One requirement is to prevent a local
> root user from accessing fs information without appropriate
> permissions. 

we're talking about NFS here (but also local CDs and potentially CIFS
etc). The level of security you're talking about is going to be the
same before or after cachefs.... very little against local root.

Frankly, any networking filesystem just trusts that the connection is
authenticated... eg there is SOMEONE on the machine who has the right
credentials. 

Cachefs doesn't change that; it still validates with the server before
giving userspace the data.


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
