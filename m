From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: FS-Cache fixes for IA64 export and AFS linkage
Date: Sun, 18 Jan 2009 15:29:03 -0800
Message-ID: <4973BB3F.8090702@oracle.com>
References: <16871.1232172044@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <16871.1232172044@redhat.com>
Sender: linux-ia64-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, linux-ia64 <linux-ia64@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Kyle McMartin <kyle@mcmartin.ca>, Tony Luck <tony.luck@intel.com>
List-Id: linux-next.vger.kernel.org

David Howells wrote:
> I've dropped the patch to export copy_page() for IA64 from my patchset and
> updated the AFS patch so that it no longer produces link errors if
> CONFIG_AFS_FS=y and CONFIG_FSCACHE=m but CONFIG_AFS_FSCACHE=n.
> 
> These patches are now available as:
> 
> 	http://people.redhat.com/~dhowells/fscache/patches/nfs+fscache-44.tar.bz2
> 
> and I've updated my GIT tree for Trond to pull:
> 
> 	http://git.kernel.org/?p=linux/kernel/git/dhowells/linux-2.6-nfs-fscache.git;a=shortlog

Ack.  Builds for me.  Thanks.

-- 
~Randy
