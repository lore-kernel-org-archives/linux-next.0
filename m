From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next:  kgdb tree fetch failure
Date: Wed, 22 Jul 2009 22:05:17 -0500
Message-ID: <4A67D36D.8070209@windriver.com>
References: <20090723090956.e6024af4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753030AbZGWDF1@vger.kernel.org>
In-Reply-To: <20090723090956.e6024af4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi Jason,
>
> Today's linux-next fetch of the kgdb tree failed like this:
>
> kgdb: git
> fatal: Couldn't find remote ref refs/heads/kgdb-next
> fatal: The remote end hung up unexpectedly
>
> So I will use the kgdb tree from yesterday (which actually dates from
> May).
>
>   
In the several years I have been using git, I have never seen it get
corrupted until today.

My local git repository completely bailed, so I am going to reconstruct
the kgdb branches from a new clone.  There was no obvious way to recover
my archive. 

Here is what it said:

% git push --force
ssh://master.kernel.org/staging/jwessel/linux-2.6-kgdb.git kgdb-next
fatal: bad object 4be3bd7849165e7efa6b0b35a23d6a3598d97465
error: pack-objects died with strange error
error: failed to push some refs to
'ssh://master.kernel.org/staging/jwessel/linux-2.6-kgdb.git'

I'll leave the archive around for a while, as it is nothing more than a
science project as a curiosity of how you recover from such a state.

Jason.
