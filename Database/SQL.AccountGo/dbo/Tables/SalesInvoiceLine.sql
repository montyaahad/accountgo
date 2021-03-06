﻿CREATE TABLE [dbo].[SalesInvoiceLine] (
    [Id]                        INT             IDENTITY (1, 1) NOT NULL,
    [SalesInvoiceHeaderId]      INT             NOT NULL,
    [ItemId]                    INT             NOT NULL,
    [MeasurementId]             INT             NOT NULL,
    [InventoryControlJournalId] INT             NULL,
    [TaxId]                     INT             NULL,
    [Quantity]                  DECIMAL (18, 2) NOT NULL,
    [Discount]                  DECIMAL (18, 2) NOT NULL,
    [Amount]                    DECIMAL (18, 2) NOT NULL,
    [CreatedBy]                 NVARCHAR (MAX)  NULL,
    [CreatedOn]                 DATETIME        NOT NULL,
    [ModifiedBy]                NVARCHAR (MAX)  NULL,
    [ModifiedOn]                DATETIME        NOT NULL,
    CONSTRAINT [PK_dbo.SalesInvoiceLine] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.SalesInvoiceLine_dbo.InventoryControlJournal_InventoryControlJournalId] FOREIGN KEY ([InventoryControlJournalId]) REFERENCES [dbo].[InventoryControlJournal] ([Id]),
    CONSTRAINT [FK_dbo.SalesInvoiceLine_dbo.Item_ItemId] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.SalesInvoiceLine_dbo.Measurement_MeasurementId] FOREIGN KEY ([MeasurementId]) REFERENCES [dbo].[Measurement] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.SalesInvoiceLine_dbo.SalesInvoiceHeader_SalesInvoiceHeaderId] FOREIGN KEY ([SalesInvoiceHeaderId]) REFERENCES [dbo].[SalesInvoiceHeader] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.SalesInvoiceLine_dbo.Tax_TaxId] FOREIGN KEY ([TaxId]) REFERENCES [dbo].[Tax] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_InventoryControlJournalId]
    ON [dbo].[SalesInvoiceLine]([InventoryControlJournalId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ItemId]
    ON [dbo].[SalesInvoiceLine]([ItemId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MeasurementId]
    ON [dbo].[SalesInvoiceLine]([MeasurementId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SalesInvoiceHeaderId]
    ON [dbo].[SalesInvoiceLine]([SalesInvoiceHeaderId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaxId]
    ON [dbo].[SalesInvoiceLine]([TaxId] ASC);

