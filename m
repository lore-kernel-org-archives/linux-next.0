From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Thu, 13 Mar 2014 11:37:36 +1100
Message-ID: <1394671056.4840.103.camel@pasglop>
References: <20140312005152.9ac4063f65dbd233f5d50b4d@kernel.org>
	 <20140312015021.GC10106@kroah.com> <1394596541.4840.70.camel@pasglop>
	 <20140312113742.GM28112@sirena.org.uk> <1394654396.4840.94.camel@pasglop>
	 <20140312200232.GA22332@htj.dyndns.org> <1394655292.4840.97.camel@pasglop>
	 <20140312202102.GB22332@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140312202102.GB22332@htj.dyndns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2014-03-12 at 16:21 -0400, Tejun Heo wrote:
> It's a series of rather complex patches.  I really don't think
> duplicating them is a good idea.  We can either resurrect the old API
> to kill it again or set up a merge branch which I don't think is too
> unusual in situations like this.

Right, a topic branch that gets merged in both driver-core-next and
powerpc-next.

Cheers,
Ben.
