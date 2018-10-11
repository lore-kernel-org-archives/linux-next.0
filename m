From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the jc_docs tree
Date: Wed, 10 Oct 2018 17:21:23 -0700
Message-ID: <20181010172123.cf95ff7f81ad86f3a1c119d3@linux-foundation.org>
References: <20181008183840.70ebfe94@canb.auug.org.au>
        <20181008081315.GB6772@rapoport-lnx>
        <6ab76538-b836-3b22-cb29-102c613091cf@redhat.com>
        <20181008083228.33ec7c1d@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008083228.33ec7c1d@lwn.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 8 Oct 2018 08:32:28 -0600 Jonathan Corbet <corbet@lwn.net> wrote:

> On Mon, 8 Oct 2018 10:38:29 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
> > > I can do the renaming and add the patch
> > > 
> > >   "memory-hotplug.txt: add some details about locking internals"
> > > 
> > > on top of the jc_docs tree.
> > > 
> > > Does it sound Ok?
> > >   
> > 
> > Fine with me.
> 
> Works for me too.
> 
> Andrew, what is your preference for mm docs patches going forward?  It
> seems we should try to focus them on one tree or the other.  My preference
> would be to keep carrying them to avoid conflicts elsewhere, but I can
> certainly direct them youward if you'd rather they went that way.

Gee.  Case-by-case, I guess.  A lot of these changes are three-line
alterations as part of a larger patch which necessitated that
alteration.
