From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 26 (gfs2)
Date: Mon, 26 Oct 2009 08:43:56 -0700
Message-ID: <20091026084356.847d1ae2.randy.dunlap@oracle.com>
References: <20091026172104.205f15af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <cluster-devel-bounces@redhat.com>
In-Reply-To: <20091026172104.205f15af.sfr@canb.auug.org.au>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Whitehouse <swhiteho@redhat.com>
Cc: cluster-devel@redhat.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 26 Oct 2009 17:21:04 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20091016:


on i386:

(.text+0x723a8b): undefined reference to `__divdi3'

super.c::gfs2_statfs_change():
		percent = (100 * l_sc->sc_free) / m_sc->sc_free;


I guess it needs to use div64() etc.

---
~Randy
