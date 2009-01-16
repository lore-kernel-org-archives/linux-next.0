From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build problem with nfs tree (Was: Re:
 [mmotm][PATCH] fix ia64 build error)
Date: Fri, 16 Jan 2009 15:34:17 +1100
Message-ID: <20090116153417.891297ca.sfr@canb.auug.org.au>
References: <20090115200315.EBE3.KOSAKI.MOTOHIRO@jp.fujitsu.com>
	<20090115093514.f3f6b8ff.akpm@linux-foundation.org>
	<20090116124949.7828a559.sfr@canb.auug.org.au>
	<20090115175917.8e0ae536.akpm@linux-foundation.org>
	<20090116134930.68e783aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20090116134930.68e783aa.sfr@canb.auug.org.au>
Sender: linux-ia64-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, David Howells <dhowells@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, LKML <linux-kernel@vger.kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Kyle McMartin <kyle@mcmartin.ca>, Tony Luck <tony.luck@intel.com>, Trond Myklebust <trond.myklebust@fys.uio.no>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Fri, 16 Jan 2009 13:49:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 15 Jan 2009 17:59:17 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > I do most of my gitting across a DSL connection.  It makes GUIs
> > painful.
> 
> Yeah, I will think on it ...

With the help of Paul Mackerras, I have come up with the shell script
below.  You run it with the commit id, the tag of the tree you care
about (e.g. next-20080115)(it defaults to the current top of tree) and
the name of the branch the represents Linus' tree (default to
origin/master).  It will spit out the (or a) tree that contains the
commit you asked about.

-------------------------------------------------------------------------
#!/bin/bash

commit=$1
[ "$commit" ] || {
	echo "$0: <commit id> [<top tag> [<linus branch>]]" 1>&2
	exit 1
}

top=$2
[ "$top" ] || top=HEAD

linus=$3
[ "$linus" ] || linus=origin/master

base=$(git merge-base "$linus" "$top")

git log --first-parent --pretty='format:%H %P' "$base".."$top" |
while read m p1 p2
do
	[ "$p2" ] || continue
	git rev-list $base..$p2 | grep -q "$commit" || continue
	branch=$(git show $m | sed -n "s/[ 	]*Merge .* '\([^']*\)'/\1/p")
	tree=${branch%%/*}
	[ "$tree" = "quilt" ] && tree=${branch##*/}
	echo "$tree"
	break
done

exit 0
----------------------------------------------------------------------------
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
