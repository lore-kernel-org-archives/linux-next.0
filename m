From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Tue, 04 Oct 2011 09:49:32 +0100
Message-ID: <4E8AC89C.7010409@cam.ac.uk>
References: <20111004190542.3ae8a2d575b936520ad36c52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111004190542.3ae8a2d575b936520ad36c52@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 10/04/11 09:05, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/staging/iio/industrialio-buffer.c: In function 'iio_show_fixed_type':
> drivers/staging/iio/industrialio-buffer.c:108:7: error: '__LITTLE_ENDIAN' undeclared (first use in this function)
> 
> Caused by commit 8310b86c3cd2 ("staging:iio:scan element types: introduce
> endian description to the data format") from the staging tree.  Missing
> include file ...
> 
> I haven't bothered fixing this for today.
gah.  Sorry about that one.  Clearly should be an ifdef not an if.  Will send patch shortly.
