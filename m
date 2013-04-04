From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Date: Thu, 4 Apr 2013 09:20:48 -0400
Message-ID: <20130404132048.GB4756@thunk.org>
References: <20130404104319.42d97a8ad7badf00af7ef1e0@canb.auug.org.au>
 <alpine.LFD.2.00.1304041516160.30499@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1304041516160.30499@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?THVrw6HFoQ==?= Czerner <lczerner@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Apr 04, 2013 at 03:18:32PM +0200, Luk=C3=A1=C5=A1 Czerner wrote=
:
> I am afraid I do not understand why this is happening. The commit
> simply replaces ext4_get_group_no_and_offset() with
> ext4_get_group_number() which has the similar definition in the same
> header file. Maybe someone knows what this is all about ?

I've fixed this up already in the ext4 tree.  The problem is that you
defined the function ext4_get_group_number() as "inline", but the
function body was only in fs/ext4/balloc.c.  I have no idea why gcc
wasn't complaining about this on x86, but the fix was to simply
declare the function as "extern", not as "inline".

						- Ted
