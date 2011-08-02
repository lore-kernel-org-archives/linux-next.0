From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: linux-next: build warning after merge of the moduleh tree
Date: Tue, 2 Aug 2011 09:26:14 +0200
Message-ID: <4E37A696.2090007@fusionio.com>
References: <20110801132359.1de051cb8a4a2bdfdad7560c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110801132359.1de051cb8a4a2bdfdad7560c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike Christie <michaelc@cs.wisc.edu>
List-Id: linux-next.vger.kernel.org

On 2011-08-01 05:23, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the moduleh tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> block/bsg-lib.c:75:1: warning: data definition has no type or storage class
> block/bsg-lib.c:75:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
> block/bsg-lib.c:75:1: warning: parameter names (without types) in function declaration
> block/bsg-lib.c:164:1: warning: data definition has no type or storage class
> block/bsg-lib.c:164:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
> block/bsg-lib.c:164:1: warning: parameter names (without types) in function declaration
> block/bsg-lib.c:210:1: warning: data definition has no type or storage class
> block/bsg-lib.c:210:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
> block/bsg-lib.c:210:1: warning: parameter names (without types) in function declaration
> block/bsg-lib.c:244:1: warning: data definition has no type or storage class
> block/bsg-lib.c:244:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
> block/bsg-lib.c:244:1: warning: parameter names (without types) in function declaration
> block/bsg-lib.c:297:1: warning: data definition has no type or storage class
> block/bsg-lib.c:297:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
> block/bsg-lib.c:297:1: warning: parameter names (without types) in function declaration
> 
> This is an interaction with commit aa387cc89567 ("block: add bsg helper
> library") from the block tree.  That file should have included module.h
> but now would need export.h it seems (just uses EXPORTSYMBOL_GPL).
> 
> I applied the following as a merge fix patch:

Thanks, will you carry this until things are merged? Not easy for me to
fix up.

-- 
Jens Axboe
